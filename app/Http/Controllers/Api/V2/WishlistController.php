<?php

namespace App\Http\Controllers\Api\V2;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Response;

class WishlistController extends Controller
{
    /**
     * Get the wishlist and its items for the authenticated customer.
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getWishlist(Request $request)
    {
        $authorizationHeader = $request->header('Authorization');
        $token = null;
        if ($authorizationHeader && preg_match('/Bearer\s(\S+)/', $authorizationHeader, $matches)) {
            $token = $matches[1];
        }

        if (!$token) {
            return response()->json(['message' => 'Token is required'], 400);
        }

        // Fetch the wishlist for the customer
        $wishlist = DB::table('wishlist')
            ->where('customer_id', $token)
            ->get();

        // If no wishlist is found, return an empty response
        if ($wishlist->isEmpty()) {
            return response()->json(['message' => 'No wishlist found for this customer'], 404);
        }

        // Fetch wishlist items for the retrieved wishlist IDs
        $wishlistIds = $wishlist->pluck('wishlist_id');
        $wishlistItems = DB::table('wishlist_item')
            ->whereIn('wishlist_id', $wishlistIds)
            ->get();

        // Prepare response data
        $response = $wishlist->map(function ($wish) use ($wishlistItems) {
            $items = $wishlistItems->where('wishlist_id', $wish->wishlist_id);
            return [
                'wishlist_id' => $wish->wishlist_id,
                'name' => $wish->name,
                'items' => $items
            ];
        });

        return response()->json($response);
    }
}
