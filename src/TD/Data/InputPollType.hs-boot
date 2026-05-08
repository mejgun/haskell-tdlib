module TD.Data.InputPollType (InputPollType) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InputPollType

instance Eq InputPollType

instance Show InputPollType

instance ShortShow InputPollType

instance FromJSON InputPollType

instance ToJSON InputPollType
