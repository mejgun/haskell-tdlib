module TD.Data.Users
  (Users(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Users
  = Users -- ^ Represents a list of users
    { total_count :: Maybe Int   -- ^ Approximate total number of users found
    , user_ids    :: Maybe [Int] -- ^ A list of user identifiers
    }
  deriving (Eq, Show)

instance I.ShortShow Users where
  shortShow Users
    { total_count = total_count_
    , user_ids    = user_ids_
    }
      = "Users"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "user_ids"    `I.p` user_ids_
        ]

instance AT.FromJSON Users where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "users" -> parseUsers v
      _       -> mempty
    
    where
      parseUsers :: A.Value -> AT.Parser Users
      parseUsers = A.withObject "Users" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        user_ids_    <- o A..:?  "user_ids"
        pure $ Users
          { total_count = total_count_
          , user_ids    = user_ids_
          }
  parseJSON _ = mempty

