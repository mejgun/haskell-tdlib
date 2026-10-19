module TD.Query.SendTonWalletTransfer
  (SendTonWalletTransfer(..)
  , defaultSendTonWalletTransfer
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

-- | Sends a cryptocurrency from the user's TON wallet; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.TonWalletTransferResult.TonWalletTransferResult'
data SendTonWalletTransfer
  = SendTonWalletTransfer
    { user_id               :: Maybe Int           -- ^ Identifier of the user who will receive the transfer; pass 0 if unknown
    , address               :: Maybe T.Text        -- ^ Address in the TON blockchain of the transaction peer
    , amount                :: Maybe Int           -- ^ The amount of the sent cryptocurrency, in the smallest units of the cryptocurrency
    , comment               :: Maybe T.Text        -- ^ Comment added to the transaction
    , is_comment_encrypted  :: Maybe Bool          -- ^ Pass true if the comment is encrypted and must be decrypted using the receiver's or sender's private key
    , sending_id            :: Maybe Int           -- ^ Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
    , regular_transfer_data :: Maybe BS.ByteString -- ^ Serialized data for regular cryptocurrency transfer request. The minimum allowed transfer amount is getOption("ton_wallet_transfer_amount_min")
    , gasless_transfer_data :: Maybe BS.ByteString -- ^ Serialized data for gasless cryptocurrency transfer request; pass an empty string to force a regular request. The minimum allowed transfer amount for a gasless transfer is getOption("ton_wallet_gasless_transfer_amount_min")
    }
  deriving (Eq, Show)

instance I.ShortShow SendTonWalletTransfer where
  shortShow
    SendTonWalletTransfer
      { user_id               = user_id_
      , address               = address_
      , amount                = amount_
      , comment               = comment_
      , is_comment_encrypted  = is_comment_encrypted_
      , sending_id            = sending_id_
      , regular_transfer_data = regular_transfer_data_
      , gasless_transfer_data = gasless_transfer_data_
      }
        = "SendTonWalletTransfer"
          ++ I.cc
          [ "user_id"               `I.p` user_id_
          , "address"               `I.p` address_
          , "amount"                `I.p` amount_
          , "comment"               `I.p` comment_
          , "is_comment_encrypted"  `I.p` is_comment_encrypted_
          , "sending_id"            `I.p` sending_id_
          , "regular_transfer_data" `I.p` regular_transfer_data_
          , "gasless_transfer_data" `I.p` gasless_transfer_data_
          ]

instance AT.ToJSON SendTonWalletTransfer where
  toJSON
    SendTonWalletTransfer
      { user_id               = user_id_
      , address               = address_
      , amount                = amount_
      , comment               = comment_
      , is_comment_encrypted  = is_comment_encrypted_
      , sending_id            = sending_id_
      , regular_transfer_data = regular_transfer_data_
      , gasless_transfer_data = gasless_transfer_data_
      }
        = A.object
          [ "@type"                 A..= AT.String "sendTonWalletTransfer"
          , "user_id"               A..= user_id_
          , "address"               A..= address_
          , "amount"                A..= amount_
          , "comment"               A..= comment_
          , "is_comment_encrypted"  A..= is_comment_encrypted_
          , "sending_id"            A..= sending_id_
          , "regular_transfer_data" A..= fmap I.writeBytes  regular_transfer_data_
          , "gasless_transfer_data" A..= fmap I.writeBytes  gasless_transfer_data_
          ]

defaultSendTonWalletTransfer :: SendTonWalletTransfer
defaultSendTonWalletTransfer =
  SendTonWalletTransfer
    { user_id               = Nothing
    , address               = Nothing
    , amount                = Nothing
    , comment               = Nothing
    , is_comment_encrypted  = Nothing
    , sending_id            = Nothing
    , regular_transfer_data = Nothing
    , gasless_transfer_data = Nothing
    }

