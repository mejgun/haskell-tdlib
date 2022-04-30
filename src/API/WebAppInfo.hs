-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.WebAppInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains information about a web app 
-- 
-- __launch_id__ Unique identifier for the web app launch
-- 
-- __url__ A web app URL to open in a web view
data WebAppInfo = 

 WebAppInfo { url :: Maybe String, launch_id :: Maybe Int }  deriving (Eq)

instance Show WebAppInfo where
 show WebAppInfo { url=url, launch_id=launch_id } =
  "WebAppInfo" ++ U.cc [U.p "url" url, U.p "launch_id" launch_id ]

instance T.ToJSON WebAppInfo where
 toJSON WebAppInfo { url = url, launch_id = launch_id } =
  A.object [ "@type" A..= T.String "webAppInfo", "url" A..= url, "launch_id" A..= launch_id ]

instance T.FromJSON WebAppInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "webAppInfo" -> parseWebAppInfo v
   _ -> mempty
  where
   parseWebAppInfo :: A.Value -> T.Parser WebAppInfo
   parseWebAppInfo = A.withObject "WebAppInfo" $ \o -> do
    url <- o A..:? "url"
    launch_id <- mconcat [ o A..:? "launch_id", readMaybe <$> (o A..: "launch_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ WebAppInfo { url = url, launch_id = launch_id }
 parseJSON _ = mempty
