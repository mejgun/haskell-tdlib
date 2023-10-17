module TD.Data.Error
  ( Error(..)    
  , defaultError 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Error
  = Error -- ^ An object of this type can be returned on every function call, in case of an error
    { code    :: Maybe Int    -- ^ Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user
    , message :: Maybe T.Text -- ^ Error message; subject to future changes
    }
  deriving (Eq, Show)

instance I.ShortShow Error where
  shortShow Error
    { code    = code_
    , message = message_
    }
      = "Error"
        ++ I.cc
        [ "code"    `I.p` code_
        , "message" `I.p` message_
        ]

instance AT.FromJSON Error where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "error" -> parseError v
      _       -> mempty
    
    where
      parseError :: A.Value -> AT.Parser Error
      parseError = A.withObject "Error" $ \o -> do
        code_    <- o A..:?  "code"
        message_ <- o A..:?  "message"
        pure $ Error
          { code    = code_
          , message = message_
          }
  parseJSON _ = mempty

instance AT.ToJSON Error where
  toJSON Error
    { code    = code_
    , message = message_
    }
      = A.object
        [ "@type"   A..= AT.String "error"
        , "code"    A..= code_
        , "message" A..= message_
        ]

defaultError :: Error
defaultError =
  Error
    { code    = Nothing
    , message = Nothing
    }

