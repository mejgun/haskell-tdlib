module TD.Data.InternalLinkType (InternalLinkType) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InternalLinkType

instance Eq InternalLinkType

instance Show InternalLinkType

instance ShortShow InternalLinkType

instance FromJSON InternalLinkType

instance ToJSON InternalLinkType
