import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { StoreService } from './store.service';
import { CreateStoreDto } from './dto/create-store.dto';
import { UpdateStoreDto } from './dto/update-store.dto';

@Controller('store')
export class StoreController {
  constructor(private readonly storeService: StoreService) {}

  @Post()
  create(@Body() data: CreateStoreDto) {
    return this.storeService.create(data);
  }

  @Get()
  findAll() {
    return this.storeService.findAll();
  }

  @Get(':name')
  findByName(@Param('name') name: string) {
    return this.storeService.findByName(name);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.storeService.findOne(+id);
  }


  @Patch(':id')
  update(@Param('id') id: string, @Body() data: UpdateStoreDto) {
    return this.storeService.update(+id, data);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.storeService.remove(+id);
  }
}
