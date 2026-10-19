module TD.Query.GetTonWalletNfts
  (GetTonWalletNfts(..)
  , defaultGetTonWalletNfts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns NFTs stored on the TON wallet of the user; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.TonNfts.TonNfts'
data GetTonWalletNfts
  = GetTonWalletNfts
    { offset :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit  :: Maybe Int    -- ^ The maximum number of NFTs to be returned; must be positive and can't be greater than 20
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonWalletNfts where
  shortShow
    GetTonWalletNfts
      { offset = offset_
      , limit  = limit_
      }
        = "GetTonWalletNfts"
          ++ I.cc
          [ "offset" `I.p` offset_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON GetTonWalletNfts where
  toJSON
    GetTonWalletNfts
      { offset = offset_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "getTonWalletNfts"
          , "offset" A..= offset_
          , "limit"  A..= limit_
          ]

defaultGetTonWalletNfts :: GetTonWalletNfts
defaultGetTonWalletNfts =
  GetTonWalletNfts
    { offset = Nothing
    , limit  = Nothing
    }

