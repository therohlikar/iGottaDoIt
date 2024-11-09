<?php

namespace App\Model\Database;

use Doctrine\ORM\Mapping as ORM;
use OpenApi\Annotations as OA;

/**
 * @OA\Schema(
 *     schema="User",
 *     type="object",
 *     title="User",
 *     properties={
 *         @OA\Property(property="id", type="integer"),
 *         @OA\Property(property="username", type="string"),
 *         @OA\Property(property="country", type="string", maxLength=2)
 *     }
 * )
 */
#[ORM\Entity]
#[ORM\Table(name: 'user')]
class User implements \JsonSerializable
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    protected int $id;

    #[ORM\Column(length: 32, unique: true, nullable: false)]
    protected string $username;

    #[ORM\Column(columnDefinition: 'CHAR(2) NOT NULL')]
    protected string $country;

    public function jsonSerialize(): array
    {
        return [
            'id' => $this->id,
            'username' => $this->username,
            'country' => $this->country
        ];
    }
}