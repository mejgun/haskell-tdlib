module TD.Data.InputMessageContent (InputMessageContent) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InputMessageContent

instance Eq InputMessageContent

instance Show InputMessageContent

instance ShortShow InputMessageContent

instance FromJSON InputMessageContent

instance ToJSON InputMessageContent
