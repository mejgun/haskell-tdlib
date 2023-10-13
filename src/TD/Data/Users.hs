module TD.Data.Users
  ( Users(..)    
  , defaultUsers 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Users
  = Users -- ^ Represents a list of users
    { total_count :: Maybe Int   -- ^ Approximate total number of users found
    , user_ids    :: Maybe [Int] -- ^ A list of user identifiers
    }
  deriving (Eq)

instance Show Users where
  show Users
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

instance AT.ToJSON Users where
  toJSON Users
    { total_count = total_count_
    , user_ids    = user_ids_
    }
      = A.object
        [ "@type"       A..= AT.String "users"
        , "total_count" A..= total_count_
        , "user_ids"    A..= user_ids_
        ]

defaultUsers :: Users
defaultUsers =
  Users
    { total_count = Nothing
    , user_ids    = Nothing
    }

