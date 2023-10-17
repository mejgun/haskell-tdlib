module TD.Data.TargetChat (TargetChat) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data TargetChat

instance Eq TargetChat

instance Show TargetChat

instance ShortShow TargetChat

instance FromJSON TargetChat

instance ToJSON TargetChat
