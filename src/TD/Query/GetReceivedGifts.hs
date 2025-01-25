module TD.Query.GetReceivedGifts
  (GetReceivedGifts(..)
  , defaultGetReceivedGifts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Returns gifts received by the given user or chat. Returns 'TD.Data.ReceivedGifts.ReceivedGifts'
data GetReceivedGifts
  = GetReceivedGifts
    { owner_id          :: Maybe MessageSender.MessageSender -- ^ Identifier of the gift receiver
    , exclude_unsaved   :: Maybe Bool                        -- ^ Pass true to exclude gifts that aren't saved to the chat's profile page. Always true for gifts received by other users and channel chats without can_post_messages administrator right
    , exclude_saved     :: Maybe Bool                        -- ^ Pass true to exclude gifts that are saved to the chat's profile page; for channel chats with can_post_messages administrator right only
    , exclude_unlimited :: Maybe Bool                        -- ^ Pass true to exclude gifts that can be purchased unlimited number of times; for channel chats with can_post_messages administrator right only
    , exclude_limited   :: Maybe Bool                        -- ^ Pass true to exclude gifts that can be purchased limited number of times; for channel chats with can_post_messages administrator right only
    , exclude_upgraded  :: Maybe Bool                        -- ^ Pass true to exclude upgraded gifts; for channel chats with can_post_messages administrator right only
    , sort_by_price     :: Maybe Bool                        -- ^ Pass true to sort results by gift price instead of send date; for channel chats with can_post_messages administrator right only
    , offset            :: Maybe T.Text                      -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit             :: Maybe Int                         -- ^ The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetReceivedGifts where
  shortShow
    GetReceivedGifts
      { owner_id          = owner_id_
      , exclude_unsaved   = exclude_unsaved_
      , exclude_saved     = exclude_saved_
      , exclude_unlimited = exclude_unlimited_
      , exclude_limited   = exclude_limited_
      , exclude_upgraded  = exclude_upgraded_
      , sort_by_price     = sort_by_price_
      , offset            = offset_
      , limit             = limit_
      }
        = "GetReceivedGifts"
          ++ I.cc
          [ "owner_id"          `I.p` owner_id_
          , "exclude_unsaved"   `I.p` exclude_unsaved_
          , "exclude_saved"     `I.p` exclude_saved_
          , "exclude_unlimited" `I.p` exclude_unlimited_
          , "exclude_limited"   `I.p` exclude_limited_
          , "exclude_upgraded"  `I.p` exclude_upgraded_
          , "sort_by_price"     `I.p` sort_by_price_
          , "offset"            `I.p` offset_
          , "limit"             `I.p` limit_
          ]

instance AT.ToJSON GetReceivedGifts where
  toJSON
    GetReceivedGifts
      { owner_id          = owner_id_
      , exclude_unsaved   = exclude_unsaved_
      , exclude_saved     = exclude_saved_
      , exclude_unlimited = exclude_unlimited_
      , exclude_limited   = exclude_limited_
      , exclude_upgraded  = exclude_upgraded_
      , sort_by_price     = sort_by_price_
      , offset            = offset_
      , limit             = limit_
      }
        = A.object
          [ "@type"             A..= AT.String "getReceivedGifts"
          , "owner_id"          A..= owner_id_
          , "exclude_unsaved"   A..= exclude_unsaved_
          , "exclude_saved"     A..= exclude_saved_
          , "exclude_unlimited" A..= exclude_unlimited_
          , "exclude_limited"   A..= exclude_limited_
          , "exclude_upgraded"  A..= exclude_upgraded_
          , "sort_by_price"     A..= sort_by_price_
          , "offset"            A..= offset_
          , "limit"             A..= limit_
          ]

defaultGetReceivedGifts :: GetReceivedGifts
defaultGetReceivedGifts =
  GetReceivedGifts
    { owner_id          = Nothing
    , exclude_unsaved   = Nothing
    , exclude_saved     = Nothing
    , exclude_unlimited = Nothing
    , exclude_limited   = Nothing
    , exclude_upgraded  = Nothing
    , sort_by_price     = Nothing
    , offset            = Nothing
    , limit             = Nothing
    }

