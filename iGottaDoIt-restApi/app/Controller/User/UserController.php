<?php

namespace App\Controller\User;

use App\Model\Database\User;
use App\Controller\BaseController;
use Doctrine\ORM\EntityManagerInterface;
use Apitte\Core\Annotation\Controller\Method;
use Apitte\Core\Annotation\Controller\Path;
use Apitte\Core\Http\ApiRequest;
use Apitte\Core\Http\ApiResponse;
use Nette\Utils\Json;

use OpenApi\Annotations as OA;

/**
 * @Path("/users")
 */
class UserController extends BaseController
{
    public function __construct(private EntityManagerInterface $em){

    }

    /**
     * @Path("/")
     * @Method("GET")
     * @OA\Get(
     *     path="/api/users",
     *     summary="Retrieve all users",
     *     description="Returns a list of all users in the database.",
     *     tags={"Users"},
     *     @OA\Response(
     *         response=200,
     *         description="List of users",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(ref="#/components/schemas/User")
     *         )
     *     ),
     *     @OA\Response(
     *         response=500,
     *         description="Internal server error"
     *     )
     * )
     */
    public function getAllUsers(ApiRequest $request, ApiResponse $response): ApiResponse
    {
        $users = $this->em->getRepository(User::class)->findAll();

        $response->getBody()->write(Json::encode($users));
        return $response->withHeader('Content-Type', 'application/json');
    }

}