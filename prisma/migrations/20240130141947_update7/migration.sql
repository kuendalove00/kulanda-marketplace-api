/*
  Warnings:

  - You are about to drop the column `ownerID` on the `stores` table. All the data in the column will be lost.
  - You are about to drop the `owners` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userID]` on the table `Stores` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userID` to the `Stores` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `owners` DROP FOREIGN KEY `Owners_userID_fkey`;

-- DropForeignKey
ALTER TABLE `stores` DROP FOREIGN KEY `Stores_ownerID_fkey`;

-- AlterTable
ALTER TABLE `stores` DROP COLUMN `ownerID`,
    ADD COLUMN `userID` INTEGER NOT NULL;

-- DropTable
DROP TABLE `owners`;

-- CreateIndex
CREATE UNIQUE INDEX `Stores_userID_key` ON `Stores`(`userID`);

-- AddForeignKey
ALTER TABLE `Stores` ADD CONSTRAINT `Stores_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
