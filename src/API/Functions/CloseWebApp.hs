-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CloseWebApp where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Informs TDLib that a previously opened web app was closed 
-- 
-- __web_app_launch_id__ Identifier of web app launch, received from openWebApp
data CloseWebApp = 

 CloseWebApp { web_app_launch_id :: Maybe Int }  deriving (Eq)

instance Show CloseWebApp where
 show CloseWebApp { web_app_launch_id=web_app_launch_id } =
  "CloseWebApp" ++ cc [p "web_app_launch_id" web_app_launch_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CloseWebApp where
 toJSON CloseWebApp { web_app_launch_id = web_app_launch_id } =
  A.object [ "@type" A..= T.String "closeWebApp", "web_app_launch_id" A..= web_app_launch_id ]

instance T.FromJSON CloseWebApp where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "closeWebApp" -> parseCloseWebApp v
   _ -> mempty
  where
   parseCloseWebApp :: A.Value -> T.Parser CloseWebApp
   parseCloseWebApp = A.withObject "CloseWebApp" $ \o -> do
    web_app_launch_id <- mconcat [ o A..:? "web_app_launch_id", readMaybe <$> (o A..: "web_app_launch_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CloseWebApp { web_app_launch_id = web_app_launch_id }
 parseJSON _ = mempty
