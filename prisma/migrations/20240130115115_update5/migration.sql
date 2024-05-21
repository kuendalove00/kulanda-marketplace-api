/*
  Warnings:

  - You are about to drop the column `colorName` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `colorValue` on the `products` table. All the data in the column will be lost.
  - Added the required column `storeId` to the `Products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `products` DROP COLUMN `colorName`,
    DROP COLUMN `colorValue`,
    ADD COLUMN `storeId` VARCHAR(191) NOT NULL;
