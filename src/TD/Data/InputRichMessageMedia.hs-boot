module TD.Data.InputRichMessageMedia (InputRichMessageMedia) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InputRichMessageMedia

instance Eq InputRichMessageMedia

instance Show InputRichMessageMedia

instance ShortShow InputRichMessageMedia

instance FromJSON InputRichMessageMedia

instance ToJSON InputRichMessageMedia
