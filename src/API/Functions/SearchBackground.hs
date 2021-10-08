-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchBackground where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for a background by its name 
-- 
-- __name__ The name of the background
data SearchBackground = 

 SearchBackground { name :: Maybe String }  deriving (Eq)

instance Show SearchBackground where
 show SearchBackground { name=name } =
  "SearchBackground" ++ cc [p "name" name ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchBackground where
 toJSON SearchBackground { name = name } =
  A.object [ "@type" A..= T.String "searchBackground", "name" A..= name ]

instance T.FromJSON SearchBackground where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchBackground" -> parseSearchBackground v
   _ -> mempty
  where
   parseSearchBackground :: A.Value -> T.Parser SearchBackground
   parseSearchBackground = A.withObject "SearchBackground" $ \o -> do
    name <- o A..:? "name"
    return $ SearchBackground { name = name }
 parseJSON _ = mempty
