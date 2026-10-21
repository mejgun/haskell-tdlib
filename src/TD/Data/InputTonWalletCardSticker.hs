module TD.Data.InputTonWalletCardSticker
  ( InputTonWalletCardSticker(..)    
  , defaultInputTonWalletCardSticker 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AreaPosition as AreaPosition
import qualified Data.Text as T

data InputTonWalletCardSticker
  = InputTonWalletCardSticker -- ^ Describes a sticker to be placed on the TON wallet card of the current user
    { position    :: Maybe AreaPosition.AreaPosition -- ^ Position of the sticker on the card
    , nft_address :: Maybe T.Text                    -- ^ Address of an NFT owned by the wallet, which is an upgraded gift; use getTonWalletNfts to get the list of owned NFTs
    }
  deriving (Eq, Show)

instance I.ShortShow InputTonWalletCardSticker where
  shortShow InputTonWalletCardSticker
    { position    = position_
    , nft_address = nft_address_
    }
      = "InputTonWalletCardSticker"
        ++ I.cc
        [ "position"    `I.p` position_
        , "nft_address" `I.p` nft_address_
        ]

instance AT.FromJSON InputTonWalletCardSticker where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputTonWalletCardSticker" -> parseInputTonWalletCardSticker v
      _                           -> mempty
    
    where
      parseInputTonWalletCardSticker :: A.Value -> AT.Parser InputTonWalletCardSticker
      parseInputTonWalletCardSticker = A.withObject "InputTonWalletCardSticker" $ \o -> do
        position_    <- o A..:?  "position"
        nft_address_ <- o A..:?  "nft_address"
        pure $ InputTonWalletCardSticker
          { position    = position_
          , nft_address = nft_address_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputTonWalletCardSticker where
  toJSON InputTonWalletCardSticker
    { position    = position_
    , nft_address = nft_address_
    }
      = A.object
        [ "@type"       A..= AT.String "inputTonWalletCardSticker"
        , "position"    A..= position_
        , "nft_address" A..= nft_address_
        ]

defaultInputTonWalletCardSticker :: InputTonWalletCardSticker
defaultInputTonWalletCardSticker =
  InputTonWalletCardSticker
    { position    = Nothing
    , nft_address = Nothing
    }

