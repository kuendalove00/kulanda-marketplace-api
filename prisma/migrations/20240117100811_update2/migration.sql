/*
  Warnings:

  - You are about to drop the column `storeId` on the `customization` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Brands` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Models` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `storeID` to the `Customization` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `customization` DROP COLUMN `storeId`,
    ADD COLUMN `storeID` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Brands_name_key` ON `Brands`(`name`);

-- CreateIndex
CREATE UNIQUE INDEX `Models_name_key` ON `Models`(`name`);
