module TD.Data.TemporaryPasswordState
  ( TemporaryPasswordState(..)    
  , defaultTemporaryPasswordState 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data TemporaryPasswordState
  = TemporaryPasswordState -- ^ Returns information about the availability of a temporary password, which can be used for payments
    { has_password :: Maybe Bool -- ^ True, if a temporary password is available
    , valid_for    :: Maybe Int  -- ^ Time left before the temporary password expires, in seconds
    }
  deriving (Eq)

instance Show TemporaryPasswordState where
  show TemporaryPasswordState
    { has_password = has_password_
    , valid_for    = valid_for_
    }
      = "TemporaryPasswordState"
        ++ I.cc
        [ "has_password" `I.p` has_password_
        , "valid_for"    `I.p` valid_for_
        ]

instance AT.FromJSON TemporaryPasswordState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "temporaryPasswordState" -> parseTemporaryPasswordState v
      _                        -> mempty
    
    where
      parseTemporaryPasswordState :: A.Value -> AT.Parser TemporaryPasswordState
      parseTemporaryPasswordState = A.withObject "TemporaryPasswordState" $ \o -> do
        has_password_ <- o A..:?  "has_password"
        valid_for_    <- o A..:?  "valid_for"
        pure $ TemporaryPasswordState
          { has_password = has_password_
          , valid_for    = valid_for_
          }
  parseJSON _ = mempty

instance AT.ToJSON TemporaryPasswordState where
  toJSON TemporaryPasswordState
    { has_password = has_password_
    , valid_for    = valid_for_
    }
      = A.object
        [ "@type"        A..= AT.String "temporaryPasswordState"
        , "has_password" A..= has_password_
        , "valid_for"    A..= valid_for_
        ]

defaultTemporaryPasswordState :: TemporaryPasswordState
defaultTemporaryPasswordState =
  TemporaryPasswordState
    { has_password = Nothing
    , valid_for    = Nothing
    }

