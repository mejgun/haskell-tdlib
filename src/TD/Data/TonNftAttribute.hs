module TD.Data.TonNftAttribute
  (TonNftAttribute(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TonNftAttribute
  = TonNftAttribute -- ^ Represents an attribute of an NFT in the TON blockchain
    { trait_type :: Maybe T.Text -- ^ Trait type
    , value      :: Maybe T.Text -- ^ Value of the attribute
    }
  deriving (Eq, Show)

instance I.ShortShow TonNftAttribute where
  shortShow TonNftAttribute
    { trait_type = trait_type_
    , value      = value_
    }
      = "TonNftAttribute"
        ++ I.cc
        [ "trait_type" `I.p` trait_type_
        , "value"      `I.p` value_
        ]

instance AT.FromJSON TonNftAttribute where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonNftAttribute" -> parseTonNftAttribute v
      _                 -> mempty
    
    where
      parseTonNftAttribute :: A.Value -> AT.Parser TonNftAttribute
      parseTonNftAttribute = A.withObject "TonNftAttribute" $ \o -> do
        trait_type_ <- o A..:?  "trait_type"
        value_      <- o A..:?  "value"
        pure $ TonNftAttribute
          { trait_type = trait_type_
          , value      = value_
          }
  parseJSON _ = mempty

