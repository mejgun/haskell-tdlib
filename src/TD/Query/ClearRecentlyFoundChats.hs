module TD.Query.ClearRecentlyFoundChats
  (ClearRecentlyFoundChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Clears the list of recently found chats
data ClearRecentlyFoundChats
  = ClearRecentlyFoundChats
  deriving (Eq)

instance Show ClearRecentlyFoundChats where
  show
    ClearRecentlyFoundChats
        = "ClearRecentlyFoundChats"

instance AT.ToJSON ClearRecentlyFoundChats where
  toJSON
    ClearRecentlyFoundChats
        = A.object
          [ "@type" A..= AT.String "clearRecentlyFoundChats"
          ]

