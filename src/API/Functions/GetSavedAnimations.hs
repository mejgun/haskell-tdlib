-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedAnimations where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns saved animations
data GetSavedAnimations = 

 GetSavedAnimations deriving (Eq)

instance Show GetSavedAnimations where
 show GetSavedAnimations {  } =
  "GetSavedAnimations" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetSavedAnimations where
 toJSON GetSavedAnimations {  } =
  A.object [ "@type" A..= T.String "getSavedAnimations" ]

instance T.FromJSON GetSavedAnimations where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSavedAnimations" -> parseGetSavedAnimations v
   _ -> mempty
  where
   parseGetSavedAnimations :: A.Value -> T.Parser GetSavedAnimations
   parseGetSavedAnimations = A.withObject "GetSavedAnimations" $ \o -> do
    return $ GetSavedAnimations {  }
 parseJSON _ = mempty
