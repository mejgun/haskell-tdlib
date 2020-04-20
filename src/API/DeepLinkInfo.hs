-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DeepLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

--main = putStrLn "ok"

data DeepLinkInfo = 
 DeepLinkInfo { need_update_application :: Bool, text :: FormattedText.FormattedText }  -- deriving (Show)

instance T.ToJSON DeepLinkInfo where
 toJSON (DeepLinkInfo { need_update_application = need_update_application, text = text }) =
  A.object [ "@type" A..= T.String "deepLinkInfo", "need_update_application" A..= need_update_application, "text" A..= text ]
-- deepLinkInfo DeepLinkInfo  { need_update_application :: Bool, text :: FormattedText.FormattedText } 

