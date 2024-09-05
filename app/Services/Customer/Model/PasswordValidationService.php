<?php

namespace App\Services\Customer\Model;

use Illuminate\Support\Facades\Hash;
use SodiumException;

class PasswordValidationService
{
    const HASH_VERSION_ARGON2ID13 = 1;
    const HASH_VERSION_ARGON2ID13_AGNOSTIC = 'argon2id';

    /**
     * Validate the password against a hash using multiple algorithms.
     *
     * @param string $password
     * @param string $hash
     * @return bool
     */
    public function isValidHash(string $password, string $hash): bool
    {
        // Regular expression for Argon2id agnostic hashes
        $agnosticArgonRegEx = '/^' . self::HASH_VERSION_ARGON2ID13_AGNOSTIC
            . '\_(?<seed>\d+)\_(?<ops>\d+)\_(?<mem>\d+)$/';

        try {
            [$hashedPassword, $hashSalt, $hashVersions] = $this->explodePasswordHash($hash);
            $recreated = $password;

            // Iterate through all hash versions and recreate the hash to compare
            foreach ($hashVersions as $hashVersion) {
                if (is_string($hashVersion) && preg_match($agnosticArgonRegEx, $hashVersion, $argonParams)) {
                    // Handle Argon2id agnostic hash
                    $recreated = $this->getArgonHash(
                        $recreated,
                        (int)$argonParams['seed'],
                        (int)$argonParams['ops'],
                        (int)$argonParams['mem'],
                        $hashSalt
                    );
                } elseif ((int)$hashVersion === self::HASH_VERSION_ARGON2ID13) {
                    // Handle Argon2id standard hash
                    $recreated = $this->getArgonHash(
                        $recreated,
                        SODIUM_CRYPTO_SIGN_SEEDBYTES,
                        SODIUM_CRYPTO_PWHASH_OPSLIMIT_INTERACTIVE,
                        SODIUM_CRYPTO_PWHASH_MEMLIMIT_INTERACTIVE,
                        $hashSalt
                    );
                } else {
                    // Handle other hash versions
                    $recreated = $this->generateSimpleHash($hashSalt . $recreated, (int)$hashVersion);
                }
            }
        } catch (\Throwable $exception) {
            // If hash doesn't match any expected formats, hash the password as fallback
            $recreated = Hash::make($password);
        }

        return $this->compareStrings($recreated, $hashedPassword);
    }

    /**
     * Compare two strings in a timing-attack safe manner.
     *
     * @param string $a
     * @param string $b
     * @return bool
     */
    protected function compareStrings(string $a, string $b): bool
    {
        return hash_equals($a, $b);
    }

    /**
     * Explode the password hash into components.
     *
     * @param string $hash
     * @return array
     * @throws Exception
     */
    protected function explodePasswordHash(string $hash): array
    {
        // Split the hash into components (hash, salt, versions)
        $parts = explode(':', $hash);

        if (count($parts) < 3) {
            throw new \Exception('Invalid hash format.');
        }

        return [$parts[0], $parts[1], explode('_', $parts[2])];
    }

    /**
     * Generate a hash using Argon2id.
     *
     * @param string $password
     * @param int $seed
     * @param int $opsLimit
     * @param int $memLimit
     * @param string $salt
     * @return string
     * @throws SodiumException
     */
    protected function getArgonHash(string $password, int $seed, int $opsLimit, int $memLimit, string $salt): string
    {
        return sodium_crypto_pwhash(
            strlen($password),
            $password,
            $salt,
            $opsLimit,
            $memLimit,
            SODIUM_CRYPTO_PWHASH_ALG_ARGON2ID13
        );
    }

    /**
     * Generate a simple hash (e.g., SHA256).
     *
     * @param string $data
     * @param int $version
     * @return string
     */
    protected function generateSimpleHash(string $data, int $version): string
    {
        // Implement different hashing algorithms based on version
        switch ($version) {
            case 1:
                return hash('sha256', $data);
            default:
                throw new \Exception('Unsupported hash version.');
        }
    }
}
