module TD.Data.InputRichMessage (InputRichMessage) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InputRichMessage

instance Eq InputRichMessage

instance Show InputRichMessage

instance ShortShow InputRichMessage

instance FromJSON InputRichMessage

instance ToJSON InputRichMessage
