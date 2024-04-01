import random

with open('data_generation.sql', 'w') as file:
    file.write('INSERT INTO sandbox(content)\n')
    file.write('VALUES \n')
    maker_list = ['HP', 'Samsung', 'Acer', 'ASUS', 'Intel']
    values = []
    for code, i in enumerate(range(1, 500), start=1):
        values.append(
            f'("{random.choice(maker_list)}")'
        )

    # Чтобы в конце не стояла запятая и код корректно сработал
    file.write(',\n'.join(values) + ';')
