module TD.Data.TonWalletTransactionType
  (TonWalletTransactionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TonNft as TonNft

-- | Describes type of transaction with a TON wallet
data TonWalletTransactionType
  = TonWalletTransactionTypeOnRampDeposit -- ^ The transaction is a deposit from an on-ramp provider
    { amount        :: Maybe Int    -- ^ The amount of received cryptocurrency, in the smallest units of the cryptocurrency
    , provider_name :: Maybe T.Text -- ^ Name of the on-ramp provider
    }
  | TonWalletTransactionTypeTransfer -- ^ A transfer of TON Grams to or from the wallet
    { amount               :: Maybe Int    -- ^ The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions
    , is_gasless           :: Maybe Bool   -- ^ True, if the fee was paid by Telegram
    , comment              :: Maybe T.Text -- ^ Comment added to the transaction
    , is_comment_encrypted :: Maybe Bool   -- ^ True, if the comment is encrypted and must be decrypted using the user's private key
    }
  | TonWalletTransactionTypeNftTransfer -- ^ A transfer of a TON NFT to or from the wallet
    { nft                  :: Maybe TonNft.TonNft -- ^ The transferred NFT
    , is_outgoing          :: Maybe Bool          -- ^ True, if the transfer is outgoing
    , comment              :: Maybe T.Text        -- ^ Comment added to the transaction
    , is_comment_encrypted :: Maybe Bool          -- ^ True, if the comment is encrypted and must be decrypted using the user's private key
    }
  | TonWalletTransactionTypeTelegramGiftTransfer -- ^ A Telegram gift was minted as a TON NFT or was transferred from Telegram to the wallet or back; peer details aren't available for the transaction
    { nft         :: Maybe TonNft.TonNft -- ^ The minted or transferred NFT
    , is_outgoing :: Maybe Bool          -- ^ True, if the transfer is from the wallet to Telegram
    , is_saved    :: Maybe Bool          -- ^ True, if the gift was displayed on the current user's profile page before or after the transfer
    }
  | TonWalletTransactionTypeKeyChange -- ^ Change of the wallet key
  deriving (Eq, Show)

instance I.ShortShow TonWalletTransactionType where
  shortShow TonWalletTransactionTypeOnRampDeposit
    { amount        = amount_
    , provider_name = provider_name_
    }
      = "TonWalletTransactionTypeOnRampDeposit"
        ++ I.cc
        [ "amount"        `I.p` amount_
        , "provider_name" `I.p` provider_name_
        ]
  shortShow TonWalletTransactionTypeTransfer
    { amount               = amount_
    , is_gasless           = is_gasless_
    , comment              = comment_
    , is_comment_encrypted = is_comment_encrypted_
    }
      = "TonWalletTransactionTypeTransfer"
        ++ I.cc
        [ "amount"               `I.p` amount_
        , "is_gasless"           `I.p` is_gasless_
        , "comment"              `I.p` comment_
        , "is_comment_encrypted" `I.p` is_comment_encrypted_
        ]
  shortShow TonWalletTransactionTypeNftTransfer
    { nft                  = nft_
    , is_outgoing          = is_outgoing_
    , comment              = comment_
    , is_comment_encrypted = is_comment_encrypted_
    }
      = "TonWalletTransactionTypeNftTransfer"
        ++ I.cc
        [ "nft"                  `I.p` nft_
        , "is_outgoing"          `I.p` is_outgoing_
        , "comment"              `I.p` comment_
        , "is_comment_encrypted" `I.p` is_comment_encrypted_
        ]
  shortShow TonWalletTransactionTypeTelegramGiftTransfer
    { nft         = nft_
    , is_outgoing = is_outgoing_
    , is_saved    = is_saved_
    }
      = "TonWalletTransactionTypeTelegramGiftTransfer"
        ++ I.cc
        [ "nft"         `I.p` nft_
        , "is_outgoing" `I.p` is_outgoing_
        , "is_saved"    `I.p` is_saved_
        ]
  shortShow TonWalletTransactionTypeKeyChange
      = "TonWalletTransactionTypeKeyChange"

instance AT.FromJSON TonWalletTransactionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletTransactionTypeOnRampDeposit"        -> parseTonWalletTransactionTypeOnRampDeposit v
      "tonWalletTransactionTypeTransfer"             -> parseTonWalletTransactionTypeTransfer v
      "tonWalletTransactionTypeNftTransfer"          -> parseTonWalletTransactionTypeNftTransfer v
      "tonWalletTransactionTypeTelegramGiftTransfer" -> parseTonWalletTransactionTypeTelegramGiftTransfer v
      "tonWalletTransactionTypeKeyChange"            -> pure TonWalletTransactionTypeKeyChange
      _                                              -> mempty
    
    where
      parseTonWalletTransactionTypeOnRampDeposit :: A.Value -> AT.Parser TonWalletTransactionType
      parseTonWalletTransactionTypeOnRampDeposit = A.withObject "TonWalletTransactionTypeOnRampDeposit" $ \o -> do
        amount_        <- o A..:?  "amount"
        provider_name_ <- o A..:?  "provider_name"
        pure $ TonWalletTransactionTypeOnRampDeposit
          { amount        = amount_
          , provider_name = provider_name_
          }
      parseTonWalletTransactionTypeTransfer :: A.Value -> AT.Parser TonWalletTransactionType
      parseTonWalletTransactionTypeTransfer = A.withObject "TonWalletTransactionTypeTransfer" $ \o -> do
        amount_               <- o A..:?  "amount"
        is_gasless_           <- o A..:?  "is_gasless"
        comment_              <- o A..:?  "comment"
        is_comment_encrypted_ <- o A..:?  "is_comment_encrypted"
        pure $ TonWalletTransactionTypeTransfer
          { amount               = amount_
          , is_gasless           = is_gasless_
          , comment              = comment_
          , is_comment_encrypted = is_comment_encrypted_
          }
      parseTonWalletTransactionTypeNftTransfer :: A.Value -> AT.Parser TonWalletTransactionType
      parseTonWalletTransactionTypeNftTransfer = A.withObject "TonWalletTransactionTypeNftTransfer" $ \o -> do
        nft_                  <- o A..:?  "nft"
        is_outgoing_          <- o A..:?  "is_outgoing"
        comment_              <- o A..:?  "comment"
        is_comment_encrypted_ <- o A..:?  "is_comment_encrypted"
        pure $ TonWalletTransactionTypeNftTransfer
          { nft                  = nft_
          , is_outgoing          = is_outgoing_
          , comment              = comment_
          , is_comment_encrypted = is_comment_encrypted_
          }
      parseTonWalletTransactionTypeTelegramGiftTransfer :: A.Value -> AT.Parser TonWalletTransactionType
      parseTonWalletTransactionTypeTelegramGiftTransfer = A.withObject "TonWalletTransactionTypeTelegramGiftTransfer" $ \o -> do
        nft_         <- o A..:?  "nft"
        is_outgoing_ <- o A..:?  "is_outgoing"
        is_saved_    <- o A..:?  "is_saved"
        pure $ TonWalletTransactionTypeTelegramGiftTransfer
          { nft         = nft_
          , is_outgoing = is_outgoing_
          , is_saved    = is_saved_
          }
  parseJSON _ = mempty

