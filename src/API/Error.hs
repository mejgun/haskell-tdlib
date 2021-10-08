-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Error where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- An object of this type can be returned on every function call, in case of an error
-- 
-- __code__ Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user
-- 
-- __message__ Error message; subject to future changes
data Error = 

 Error { message :: Maybe String, code :: Maybe Int }  deriving (Eq)

instance Show Error where
 show Error { message=message, code=code } =
  "Error" ++ cc [p "message" message, p "code" code ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Error where
 toJSON Error { message = message, code = code } =
  A.object [ "@type" A..= T.String "error", "message" A..= message, "code" A..= code ]

instance T.FromJSON Error where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "error" -> parseError v
   _ -> mempty
  where
   parseError :: A.Value -> T.Parser Error
   parseError = A.withObject "Error" $ \o -> do
    message <- o A..:? "message"
    code <- mconcat [ o A..:? "code", readMaybe <$> (o A..: "code" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Error { message = message, code = code }
 parseJSON _ = mempty
