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



instance T.FromJSON EditCustomLanguagePackInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editCustomLanguagePackInfo" -> parseEditCustomLanguagePackInfo v
  where
   parseEditCustomLanguagePackInfo :: A.Value -> T.Parser EditCustomLanguagePackInfo
   parseEditCustomLanguagePackInfo = A.withObject "EditCustomLanguagePackInfo" $ \o -> do
    info <- o A..: "info"
    return $ EditCustomLanguagePackInfo { info = info }