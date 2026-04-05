module TD.Data.MessageContent (MessageContent) where

import Data.Aeson.Types (FromJSON)
import TD.Lib.Internal (ShortShow)

data MessageContent

instance Eq MessageContent

instance Show MessageContent

instance ShortShow MessageContent

instance FromJSON MessageContent


