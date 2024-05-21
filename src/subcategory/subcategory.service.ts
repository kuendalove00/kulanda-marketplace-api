import { Category } from './../category/entities/category.entity';
import { Injectable } from '@nestjs/common';
import { CreateSubcategoryDto } from './dto/create-subcategory.dto';
import { UpdateSubcategoryDto } from './dto/update-subcategory.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class SubcategoryService {
  constructor(private prisma: PrismaService){}

  async create(data : CreateSubcategoryDto) {
    const subcategory = await this.prisma.subcategories.create({ data });
    return subcategory;
  }

  async findAll() {
    const subcategories = await this.prisma.subcategories.findMany({
      select: {
        id: true,
        name: true,
        category : {
          select: {
            id: true,
            name: true
          }
        }
      }
    });
    return subcategories;
  }

  async findOne(id: number) {
    const subcategory = await this.prisma.subcategories.findUnique({
      where: {
        id: id
      }
    });

    return subcategory;
  }

  async update(id: number, data: UpdateSubcategoryDto) {
    const subcategory = await this.prisma.subcategories.update({
      where: {
        id:id
      },
      data
    });

    return subcategory;
  }

  async remove(id: number) {
    const subcategory = await this.prisma.subcategories.delete({
      where: {
        id: id
      }
    });

    return subcategory;
  }
}
