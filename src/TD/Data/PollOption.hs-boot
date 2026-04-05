module TD.Data.PollOption (PollOption) where

import Data.Aeson.Types (FromJSON)
import TD.Lib.Internal (ShortShow)

data PollOption

instance Eq PollOption

instance Show PollOption

instance ShortShow PollOption

instance FromJSON PollOption


