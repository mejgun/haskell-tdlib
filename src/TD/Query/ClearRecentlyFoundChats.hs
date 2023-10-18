module TD.Query.ClearRecentlyFoundChats
  (ClearRecentlyFoundChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Clears the list of recently found chats. Returns 'TD.Data.Ok.Ok'
data ClearRecentlyFoundChats
  = ClearRecentlyFoundChats
  deriving (Eq, Show)

instance I.ShortShow ClearRecentlyFoundChats where
  shortShow
    ClearRecentlyFoundChats
        = "ClearRecentlyFoundChats"

instance AT.ToJSON ClearRecentlyFoundChats where
  toJSON
    ClearRecentlyFoundChats
        = A.object
          [ "@type" A..= AT.String "clearRecentlyFoundChats"
          ]

