-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ReplyMarkup where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.KeyboardButton as KeyboardButton
import {-# SOURCE #-} qualified API.InlineKeyboardButton as InlineKeyboardButton

data ReplyMarkup = 
 ReplyMarkupRemoveKeyboard { is_personal :: Maybe Bool }  
 | ReplyMarkupForceReply { is_personal :: Maybe Bool }  
 | ReplyMarkupShowKeyboard { is_personal :: Maybe Bool, one_time :: Maybe Bool, resize_keyboard :: Maybe Bool, _rows :: Maybe [KeyboardButton.KeyboardButton] }  
 | ReplyMarkupInlineKeyboard { rows :: Maybe [InlineKeyboardButton.InlineKeyboardButton] }  deriving (Show)

instance T.ToJSON ReplyMarkup where
 toJSON (ReplyMarkupRemoveKeyboard { is_personal = is_personal }) =
  A.object [ "@type" A..= T.String "replyMarkupRemoveKeyboard", "is_personal" A..= is_personal ]

 toJSON (ReplyMarkupForceReply { is_personal = is_personal }) =
  A.object [ "@type" A..= T.String "replyMarkupForceReply", "is_personal" A..= is_personal ]

 toJSON (ReplyMarkupShowKeyboard { is_personal = is_personal, one_time = one_time, resize_keyboard = resize_keyboard, _rows = _rows }) =
  A.object [ "@type" A..= T.String "replyMarkupShowKeyboard", "is_personal" A..= is_personal, "one_time" A..= one_time, "resize_keyboard" A..= resize_keyboard, "rows" A..= _rows ]

 toJSON (ReplyMarkupInlineKeyboard { rows = rows }) =
  A.object [ "@type" A..= T.String "replyMarkupInlineKeyboard", "rows" A..= rows ]

instance T.FromJSON ReplyMarkup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "replyMarkupRemoveKeyboard" -> parseReplyMarkupRemoveKeyboard v
   "replyMarkupForceReply" -> parseReplyMarkupForceReply v
   "replyMarkupShowKeyboard" -> parseReplyMarkupShowKeyboard v
   "replyMarkupInlineKeyboard" -> parseReplyMarkupInlineKeyboard v
   _ -> mempty
  where
   parseReplyMarkupRemoveKeyboard :: A.Value -> T.Parser ReplyMarkup
   parseReplyMarkupRemoveKeyboard = A.withObject "ReplyMarkupRemoveKeyboard" $ \o -> do
    is_personal <- optional $ o A..: "is_personal"
    return $ ReplyMarkupRemoveKeyboard { is_personal = is_personal }

   parseReplyMarkupForceReply :: A.Value -> T.Parser ReplyMarkup
   parseReplyMarkupForceReply = A.withObject "ReplyMarkupForceReply" $ \o -> do
    is_personal <- optional $ o A..: "is_personal"
    return $ ReplyMarkupForceReply { is_personal = is_personal }

   parseReplyMarkupShowKeyboard :: A.Value -> T.Parser ReplyMarkup
   parseReplyMarkupShowKeyboard = A.withObject "ReplyMarkupShowKeyboard" $ \o -> do
    is_personal <- optional $ o A..: "is_personal"
    one_time <- optional $ o A..: "one_time"
    resize_keyboard <- optional $ o A..: "resize_keyboard"
    _rows <- optional $ o A..: "rows"
    return $ ReplyMarkupShowKeyboard { is_personal = is_personal, one_time = one_time, resize_keyboard = resize_keyboard, _rows = _rows }

   parseReplyMarkupInlineKeyboard :: A.Value -> T.Parser ReplyMarkup
   parseReplyMarkupInlineKeyboard = A.withObject "ReplyMarkupInlineKeyboard" $ \o -> do
    rows <- optional $ o A..: "rows"
    return $ ReplyMarkupInlineKeyboard { rows = rows }