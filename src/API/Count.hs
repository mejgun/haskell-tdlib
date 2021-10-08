-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Count where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains a counter 
-- 
-- __count__ Count
data Count = 

 Count { count :: Maybe Int }  deriving (Eq)

instance Show Count where
 show Count { count=count } =
  "Count" ++ cc [p "count" count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Count where
 toJSON Count { count = count } =
  A.object [ "@type" A..= T.String "count", "count" A..= count ]

instance T.FromJSON Count where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "count" -> parseCount v
   _ -> mempty
  where
   parseCount :: A.Value -> T.Parser Count
   parseCount = A.withObject "Count" $ \o -> do
    count <- mconcat [ o A..:? "count", readMaybe <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Count { count = count }
 parseJSON _ = mempty
