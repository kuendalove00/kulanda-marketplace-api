/*
  Warnings:

  - You are about to alter the column `gender` on the `owners` table. The data in that column could be lost. The data in that column will be cast from `Enum(EnumId(0))` to `VarChar(191)`.
  - You are about to alter the column `role` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Enum(EnumId(1))` to `VarChar(191)`.
  - You are about to drop the `customization` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `images` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `productdetails` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `brandID` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `photo` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `customization` to the `Stores` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `customization` DROP FOREIGN KEY `Customization_storeID_fkey`;

-- DropForeignKey
ALTER TABLE `images` DROP FOREIGN KEY `Images_productID_fkey`;

-- DropForeignKey
ALTER TABLE `productdetails` DROP FOREIGN KEY `ProductDetails_productID_fkey`;

-- AlterTable
ALTER TABLE `owners` MODIFY `gender` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `products` ADD COLUMN `brandID` INTEGER NOT NULL,
    ADD COLUMN `colorName` VARCHAR(191) NULL,
    ADD COLUMN `colorValue` VARCHAR(191) NULL,
    ADD COLUMN `modelID` INTEGER NULL,
    ADD COLUMN `photo` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `stores` ADD COLUMN `customization` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `user` MODIFY `role` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `customization`;

-- DropTable
DROP TABLE `images`;

-- DropTable
DROP TABLE `productdetails`;
