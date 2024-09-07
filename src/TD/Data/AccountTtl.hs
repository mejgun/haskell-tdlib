module TD.Data.AccountTtl
  ( AccountTtl(..)    
  , defaultAccountTtl 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AccountTtl
  = AccountTtl -- ^ Contains information about the period of inactivity after which the current user's account will automatically be deleted
    { days :: Maybe Int -- ^ Number of days of inactivity before the account will be flagged for deletion; 30-730 days
    }
  deriving (Eq, Show)

instance I.ShortShow AccountTtl where
  shortShow AccountTtl
    { days = days_
    }
      = "AccountTtl"
        ++ I.cc
        [ "days" `I.p` days_
        ]

instance AT.FromJSON AccountTtl where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "accountTtl" -> parseAccountTtl v
      _            -> mempty
    
    where
      parseAccountTtl :: A.Value -> AT.Parser AccountTtl
      parseAccountTtl = A.withObject "AccountTtl" $ \o -> do
        days_ <- o A..:?  "days"
        pure $ AccountTtl
          { days = days_
          }
  parseJSON _ = mempty

instance AT.ToJSON AccountTtl where
  toJSON AccountTtl
    { days = days_
    }
      = A.object
        [ "@type" A..= AT.String "accountTtl"
        , "days"  A..= days_
        ]

defaultAccountTtl :: AccountTtl
defaultAccountTtl =
  AccountTtl
    { days = Nothing
    }

