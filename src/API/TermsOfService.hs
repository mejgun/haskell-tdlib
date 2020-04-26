-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TermsOfService where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Contains Telegram terms of service 
-- 
-- __text__ Text of the terms of service
-- 
-- __min_user_age__ The minimum age of a user to be able to accept the terms; 0 if any
-- 
-- __show_popup__ True, if a blocking popup with terms of service must be shown to the user
data TermsOfService = 
 TermsOfService { show_popup :: Maybe Bool, min_user_age :: Maybe Int, text :: Maybe FormattedText.FormattedText }  deriving (Show, Eq)

instance T.ToJSON TermsOfService where
 toJSON (TermsOfService { show_popup = show_popup, min_user_age = min_user_age, text = text }) =
  A.object [ "@type" A..= T.String "termsOfService", "show_popup" A..= show_popup, "min_user_age" A..= min_user_age, "text" A..= text ]

instance T.FromJSON TermsOfService where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "termsOfService" -> parseTermsOfService v
   _ -> mempty
  where
   parseTermsOfService :: A.Value -> T.Parser TermsOfService
   parseTermsOfService = A.withObject "TermsOfService" $ \o -> do
    show_popup <- o A..:? "show_popup"
    min_user_age <- mconcat [ o A..:? "min_user_age", readMaybe <$> (o A..: "min_user_age" :: T.Parser String)] :: T.Parser (Maybe Int)
    text <- o A..:? "text"
    return $ TermsOfService { show_popup = show_popup, min_user_age = min_user_age, text = text }