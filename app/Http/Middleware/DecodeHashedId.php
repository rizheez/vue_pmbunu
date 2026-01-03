<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Vinkla\Hashids\Facades\Hashids;

class DecodeHashedId
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, string $parameter = 'id'): Response
    {
        $hashedId = $request->route($parameter);

        if ($hashedId) {
            $decoded = Hashids::decode($hashedId);

            if (empty($decoded)) {
                abort(404, 'Invalid ID');
            }

            $request->route()->setParameter($parameter, $decoded[0]);
        }

        return $next($request);
    }
}
