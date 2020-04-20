-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditCustomLanguagePackInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackInfo as LanguagePackInfo

--main = putStrLn "ok"

data EditCustomLanguagePackInfo = 
 EditCustomLanguagePackInfo { info :: LanguagePackInfo.LanguagePackInfo }  -- deriving (Show)

instance T.ToJSON EditCustomLanguagePackInfo where
 toJSON (EditCustomLanguagePackInfo { info = info }) =
  A.object [ "@type" A..= T.String "editCustomLanguagePackInfo", "info" A..= info ]
-- editCustomLanguagePackInfo EditCustomLanguagePackInfo  { info :: LanguagePackInfo.LanguagePackInfo } 

