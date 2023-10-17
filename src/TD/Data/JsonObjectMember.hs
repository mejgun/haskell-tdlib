module TD.Data.JsonObjectMember
  ( JsonObjectMember(..)    
  , defaultJsonObjectMember 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import {-# SOURCE #-} qualified TD.Data.JsonValue as JsonValue

data JsonObjectMember
  = JsonObjectMember -- ^ Represents one member of a JSON object
    { key   :: Maybe T.Text              -- ^ Member's key
    , value :: Maybe JsonValue.JsonValue -- ^ Member's value
    }
  deriving (Eq, Show)

instance I.ShortShow JsonObjectMember where
  shortShow JsonObjectMember
    { key   = key_
    , value = value_
    }
      = "JsonObjectMember"
        ++ I.cc
        [ "key"   `I.p` key_
        , "value" `I.p` value_
        ]

instance AT.FromJSON JsonObjectMember where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "jsonObjectMember" -> parseJsonObjectMember v
      _                  -> mempty
    
    where
      parseJsonObjectMember :: A.Value -> AT.Parser JsonObjectMember
      parseJsonObjectMember = A.withObject "JsonObjectMember" $ \o -> do
        key_   <- o A..:?  "key"
        value_ <- o A..:?  "value"
        pure $ JsonObjectMember
          { key   = key_
          , value = value_
          }
  parseJSON _ = mempty

instance AT.ToJSON JsonObjectMember where
  toJSON JsonObjectMember
    { key   = key_
    , value = value_
    }
      = A.object
        [ "@type" A..= AT.String "jsonObjectMember"
        , "key"   A..= key_
        , "value" A..= value_
        ]

defaultJsonObjectMember :: JsonObjectMember
defaultJsonObjectMember =
  JsonObjectMember
    { key   = Nothing
    , value = Nothing
    }

