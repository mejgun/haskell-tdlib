module TD.Data.InputPollOption (InputPollOption) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InputPollOption

instance Eq InputPollOption

instance Show InputPollOption

instance ShortShow InputPollOption

instance FromJSON InputPollOption

instance ToJSON InputPollOption
