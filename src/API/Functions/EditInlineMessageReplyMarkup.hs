-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageReplyMarkup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Edits the reply markup of an inline message sent via a bot; for bots only
-- 
-- __inline_message_id__ Inline message identifier
-- 
-- __reply_markup__ The new message reply markup; pass null if none
data EditInlineMessageReplyMarkup = 

 EditInlineMessageReplyMarkup { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, inline_message_id :: Maybe String }  deriving (Eq)

instance Show EditInlineMessageReplyMarkup where
 show EditInlineMessageReplyMarkup { reply_markup=reply_markup, inline_message_id=inline_message_id } =
  "EditInlineMessageReplyMarkup" ++ cc [p "reply_markup" reply_markup, p "inline_message_id" inline_message_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON EditInlineMessageReplyMarkup where
 toJSON EditInlineMessageReplyMarkup { reply_markup = reply_markup, inline_message_id = inline_message_id } =
  A.object [ "@type" A..= T.String "editInlineMessageReplyMarkup", "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON EditInlineMessageReplyMarkup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageReplyMarkup" -> parseEditInlineMessageReplyMarkup v
   _ -> mempty
  where
   parseEditInlineMessageReplyMarkup :: A.Value -> T.Parser EditInlineMessageReplyMarkup
   parseEditInlineMessageReplyMarkup = A.withObject "EditInlineMessageReplyMarkup" $ \o -> do
    reply_markup <- o A..:? "reply_markup"
    inline_message_id <- o A..:? "inline_message_id"
    return $ EditInlineMessageReplyMarkup { reply_markup = reply_markup, inline_message_id = inline_message_id }
 parseJSON _ = mempty
