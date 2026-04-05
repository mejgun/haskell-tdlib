module TD.Data.PollType (PollType) where

import Data.Aeson.Types (FromJSON)
import TD.Lib.Internal (ShortShow)

data PollType

instance Eq PollType

instance Show PollType

instance ShortShow PollType

instance FromJSON PollType


