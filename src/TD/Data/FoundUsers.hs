module TD.Data.FoundUsers
  (FoundUsers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data FoundUsers
  = FoundUsers -- ^ Represents a list of found users
    { user_ids    :: Maybe [Int]  -- ^ Identifiers of the found users
    , next_offset :: Maybe T.Text -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow FoundUsers where
  shortShow FoundUsers
    { user_ids    = user_ids_
    , next_offset = next_offset_
    }
      = "FoundUsers"
        ++ I.cc
        [ "user_ids"    `I.p` user_ids_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON FoundUsers where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundUsers" -> parseFoundUsers v
      _            -> mempty
    
    where
      parseFoundUsers :: A.Value -> AT.Parser FoundUsers
      parseFoundUsers = A.withObject "FoundUsers" $ \o -> do
        user_ids_    <- o A..:?  "user_ids"
        next_offset_ <- o A..:?  "next_offset"
        pure $ FoundUsers
          { user_ids    = user_ids_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

