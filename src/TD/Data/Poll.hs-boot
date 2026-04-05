module TD.Data.Poll (Poll) where

import Data.Aeson.Types (FromJSON)
import TD.Lib.Internal (ShortShow)

data Poll

instance Eq Poll

instance Show Poll

instance ShortShow Poll

instance FromJSON Poll


