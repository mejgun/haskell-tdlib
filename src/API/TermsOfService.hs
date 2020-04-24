-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TermsOfService where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

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
    show_popup <- optional $ o A..: "show_popup"
    min_user_age <- optional $ o A..: "min_user_age"
    text <- optional $ o A..: "text"
    return $ TermsOfService { show_popup = show_popup, min_user_age = min_user_age, text = text }