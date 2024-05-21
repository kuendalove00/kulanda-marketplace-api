import { Injectable } from '@nestjs/common';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class CategoryService {
  constructor(private prisma: PrismaService){}

  async create(data : CreateCategoryDto) {
    console.log(data);
    const category = await this.prisma.categories.create({data});
    return category;
  }

  async findAll() {
    const categories = await this.prisma.categories.findMany();
    return categories;
  }

  async findOne(id: number) {
    const category = await this.prisma.categories.findUnique({
      where: {
        id: id
      }
    });

    return category;
  }

  async update(id: number, data: UpdateCategoryDto) {
    const category = await this.prisma.categories.update({
      where: {
        id:id
      },
      data
    });

    return category;
  }

  async remove(id: number) {
    const category = await this.prisma.categories.delete({
      where: {
        id: id
      }
    });

    return category;
  }
}
