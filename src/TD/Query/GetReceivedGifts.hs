module TD.Query.GetReceivedGifts
  (GetReceivedGifts(..)
  , defaultGetReceivedGifts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.MessageSender as MessageSender

-- | Returns gifts received by the given user or chat. Returns 'TD.Data.ReceivedGifts.ReceivedGifts'
data GetReceivedGifts
  = GetReceivedGifts
    { business_connection_id :: Maybe T.Text                      -- ^ Unique identifier of business connection on behalf of which to send the request; for bots only
    , owner_id               :: Maybe MessageSender.MessageSender -- ^ Identifier of the gift receiver
    , collection_id          :: Maybe Int                         -- ^ Pass collection identifier to get gifts only from the specified collection; pass 0 to get gifts regardless of collections
    , exclude_unsaved        :: Maybe Bool                        -- ^ Pass true to exclude gifts that aren't saved to the chat's profile page. Always true for gifts received by other users and channel chats without can_post_messages administrator right
    , exclude_saved          :: Maybe Bool                        -- ^ Pass true to exclude gifts that are saved to the chat's profile page. Always false for gifts received by other users and channel chats without can_post_messages administrator right
    , exclude_unlimited      :: Maybe Bool                        -- ^ Pass true to exclude gifts that can be purchased unlimited number of times
    , exclude_upgradable     :: Maybe Bool                        -- ^ Pass true to exclude gifts that can be purchased limited number of times and can be upgraded
    , exclude_non_upgradable :: Maybe Bool                        -- ^ Pass true to exclude gifts that can be purchased limited number of times and can't be upgraded
    , exclude_upgraded       :: Maybe Bool                        -- ^ Pass true to exclude upgraded gifts
    , sort_by_price          :: Maybe Bool                        -- ^ Pass true to sort results by gift price instead of send date
    , offset                 :: Maybe T.Text                      -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit                  :: Maybe Int                         -- ^ The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetReceivedGifts where
  shortShow
    GetReceivedGifts
      { business_connection_id = business_connection_id_
      , owner_id               = owner_id_
      , collection_id          = collection_id_
      , exclude_unsaved        = exclude_unsaved_
      , exclude_saved          = exclude_saved_
      , exclude_unlimited      = exclude_unlimited_
      , exclude_upgradable     = exclude_upgradable_
      , exclude_non_upgradable = exclude_non_upgradable_
      , exclude_upgraded       = exclude_upgraded_
      , sort_by_price          = sort_by_price_
      , offset                 = offset_
      , limit                  = limit_
      }
        = "GetReceivedGifts"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "owner_id"               `I.p` owner_id_
          , "collection_id"          `I.p` collection_id_
          , "exclude_unsaved"        `I.p` exclude_unsaved_
          , "exclude_saved"          `I.p` exclude_saved_
          , "exclude_unlimited"      `I.p` exclude_unlimited_
          , "exclude_upgradable"     `I.p` exclude_upgradable_
          , "exclude_non_upgradable" `I.p` exclude_non_upgradable_
          , "exclude_upgraded"       `I.p` exclude_upgraded_
          , "sort_by_price"          `I.p` sort_by_price_
          , "offset"                 `I.p` offset_
          , "limit"                  `I.p` limit_
          ]

instance AT.ToJSON GetReceivedGifts where
  toJSON
    GetReceivedGifts
      { business_connection_id = business_connection_id_
      , owner_id               = owner_id_
      , collection_id          = collection_id_
      , exclude_unsaved        = exclude_unsaved_
      , exclude_saved          = exclude_saved_
      , exclude_unlimited      = exclude_unlimited_
      , exclude_upgradable     = exclude_upgradable_
      , exclude_non_upgradable = exclude_non_upgradable_
      , exclude_upgraded       = exclude_upgraded_
      , sort_by_price          = sort_by_price_
      , offset                 = offset_
      , limit                  = limit_
      }
        = A.object
          [ "@type"                  A..= AT.String "getReceivedGifts"
          , "business_connection_id" A..= business_connection_id_
          , "owner_id"               A..= owner_id_
          , "collection_id"          A..= collection_id_
          , "exclude_unsaved"        A..= exclude_unsaved_
          , "exclude_saved"          A..= exclude_saved_
          , "exclude_unlimited"      A..= exclude_unlimited_
          , "exclude_upgradable"     A..= exclude_upgradable_
          , "exclude_non_upgradable" A..= exclude_non_upgradable_
          , "exclude_upgraded"       A..= exclude_upgraded_
          , "sort_by_price"          A..= sort_by_price_
          , "offset"                 A..= offset_
          , "limit"                  A..= limit_
          ]

defaultGetReceivedGifts :: GetReceivedGifts
defaultGetReceivedGifts =
  GetReceivedGifts
    { business_connection_id = Nothing
    , owner_id               = Nothing
    , collection_id          = Nothing
    , exclude_unsaved        = Nothing
    , exclude_saved          = Nothing
    , exclude_unlimited      = Nothing
    , exclude_upgradable     = Nothing
    , exclude_non_upgradable = Nothing
    , exclude_upgraded       = Nothing
    , sort_by_price          = Nothing
    , offset                 = Nothing
    , limit                  = Nothing
    }

