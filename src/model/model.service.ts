import { Injectable } from '@nestjs/common';
import { CreateModelDto } from './dto/create-model.dto';
import { UpdateModelDto } from './dto/update-model.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ModelService {
  constructor(private prisma: PrismaService){}

  async create(data : CreateModelDto) {
    const model = await this.prisma.models.create({ data });
    return model;
  }

  async findAll() {
    const models = await this.prisma.models.findMany({
      select: {
        id: true,
        name: true,
        brand: {
          select: {
            id: true,
            name: true
          }
        }
      }
    });
    return models;
  }

  async findOne(id: number) {
    const model = await this.prisma.models.findUnique({
      where: {
        id: id
      }
    });

    return model;
  }

  async update(id: number, data: UpdateModelDto) {
    const model = await this.prisma.models.update({
      where: {
        id:id
      },
      data
    });

    return model;
  }

  async remove(id: number) {
    const model = await this.prisma.models.delete({
      where: {
        id: id
      }
    });

    return model;
  }
}
