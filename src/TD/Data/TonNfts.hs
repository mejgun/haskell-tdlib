module TD.Data.TonNfts
  (TonNfts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TonNft as TonNft
import qualified Data.Text as T

data TonNfts
  = TonNfts -- ^ Represents a list of TON NFTs
    { nfts        :: Maybe [TonNft.TonNft] -- ^ List of NFTs
    , next_offset :: Maybe T.Text          -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow TonNfts where
  shortShow TonNfts
    { nfts        = nfts_
    , next_offset = next_offset_
    }
      = "TonNfts"
        ++ I.cc
        [ "nfts"        `I.p` nfts_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON TonNfts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonNfts" -> parseTonNfts v
      _         -> mempty
    
    where
      parseTonNfts :: A.Value -> AT.Parser TonNfts
      parseTonNfts = A.withObject "TonNfts" $ \o -> do
        nfts_        <- o A..:?  "nfts"
        next_offset_ <- o A..:?  "next_offset"
        pure $ TonNfts
          { nfts        = nfts_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

