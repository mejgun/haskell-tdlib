-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TermsOfService where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

--main = putStrLn "ok"

data TermsOfService = 
 TermsOfService { show_popup :: Bool, min_user_age :: Int, text :: FormattedText.FormattedText }  -- deriving (Show)

instance T.ToJSON TermsOfService where
 toJSON (TermsOfService { show_popup = show_popup, min_user_age = min_user_age, text = text }) =
  A.object [ "@type" A..= T.String "termsOfService", "show_popup" A..= show_popup, "min_user_age" A..= min_user_age, "text" A..= text ]
-- termsOfService TermsOfService  { show_popup :: Bool, min_user_age :: Int, text :: FormattedText.FormattedText } 

